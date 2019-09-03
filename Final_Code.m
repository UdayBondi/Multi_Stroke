B=imread('ip7_skelton.png');% Sketch_Skeleton 
C=imread('ip7.png'); % Sketch after stroke grouping

I=im2bw(B,0.8);
J=im2bw(C,0.8);
imshow(I);
distance_retain=70;
no_to_move=70;
imshow(I);
no_juncpts=1;no_endpts=1;

for i=1:size(I,1)
    for j=1:size(I,2)
        prop(i,j)=1;
    end
end

%  finding the y junctions and end points
for i=2:size(I,1)
    for j=2:size(I,2)
        if I(i,j)==0
            prop(i,j)=0;
            done=0;
            %1  Refer to juncpts_cond file for understanding
            if ((I(i-1,j+1)==0)&&(I(i,j-1)==0)&&(I(i+1,j)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&done==0)
               juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %2
            if ((I(i-1,j)==0)&&(I(i,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i+1,j)==1)&&(I(i,j+1)==1)&&done==0)
                juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %3
            if ((I(i-1,j)==0)&&(I(i,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %4
            if ((I(i-1,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==0)&&(I(i-1,j)==1)&&(I(i,j-1)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %5
            if ((I(i-1,j-1)==0)&&(I(i-1,j+1)==0)&&(I(i+1,j+1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %6
            if((I(i-1,j-1)==0)&&(I(i-1,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %7
            if ((I(i-1,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %8
            if ((I(i-1,j-1)==0)&&(I(i+1,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
                  juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %9
            if ((I(i-1,j)==0)&&(I(i,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==1)&&done==0)
                   juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               done=1;
               prop(i,j)=300;
            end
            %10
            if ((I(i-1,j)==0)&&(I(i,j-1)==0)&&(I(i+1,j)==0)&&(I(i,j+1)==1)&&done==0)
                  juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %11
            if ((I(i,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==0)&&(I(i-1,j)==1)&&done==0)
                  juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %12
            if ((I(i-1,j)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==0)&&(I(i,j-1)==1)&&done==0)
                  juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %13
            if ((I(i-1,j)==0)&&(I(i+1,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j)==1)&&done==0)
                juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %14
            if ((I(i-1,j+1)==0)&&(I(i,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i,j+1)==1)&&(I(i-1,j)==1)&&(I(i+1,j)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %15
             if ((I(i-1,j-1)==0)&&(I(i-1,j+1)==0)&&(I(i+1,j)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i-1,j)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
             end
             %16
             if ((I(i-1,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i,j-1)==1)&&(I(i-1,j)==1)&&(I(i+1,j)==1)&&done==0)
                 juncpts(no_juncpts,1)=i;
               juncpts(no_juncpts,2)=j;
               no_juncpts=no_juncpts+1;
               prop(i,j)=300;
               done=1;
            end
            %finding end points
            if (I(i-1,j-1)==0)&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&(I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1;  
                 prop(i,j)=500;
            end
            
            if ((I(i-1,j)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1;   
                  prop(i,j)=500;
            end
            
            if (I(i-1,j-1)==1)&&(I(i-1,j)==1)&&(I(i-1,j+1)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&(I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
            end
            
            if ((I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==0)&&(I(i,j+1)==1)&&(I(i+1,j)==1)&&I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
            end
            
            if (I(i-1,j-1)==1&&(I(i-1,j)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==0)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1))
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1;  
                  prop(i,j)=500;
            end
            
            if (I(i-1,j-1)==1)&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==0)&&(I(i+1,j)==1)&&(I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
            end
            
            if (I(i-1,j-1)==1&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j)==0))
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
            end
            
            if (I(i-1,j-1)==1)&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&(I(i+1,j+1)==0)
                endpts(no_endpts,1)=i;
                endpts(no_endpts,2)=j;
                no_endpts=no_endpts+1;   
                 prop(i,j)=500;
            end
        end
    end
end

temp=ones(1,2);
prev=ones(1,2);
ntng=1;
%marking the free ends: if prop(i,j)=400 then i,j is a point in the
%free segment if 450 it is a point on a disconnected line,if 500 its an end point and if 300 junction point,if 380 its
%a closed junc point,if 350 its a junc having sharp corner
for i=1:no_endpts-1
    out=0;
    count=0;
    temp(1,:)=endpts(i,:);
    prev(1,:)=[0 0];
    while ntng==1
        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
        if(prop(temp(1,1),temp(1,2))==450)
            break;
        end
        count=count+1;
        if(prop(temp(1,1),temp(1,2))==300)%if a junc is encountered
            present=prev(1,:);
            prev(1,:)=temp(1,:);
            temp(1,:)=present(1,:);
            
            if(count<distance_retain)
                if(prop(temp(1,1),temp(1,2))~=500)
                 prop(temp(1,1),temp(1,2))=400;
                end
                while ntng==1
                    [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                    if(prop(temp(1,1),temp(1,2))==500)
                        out=1;
                        break;
                    end
                    prop(temp(1,1),temp(1,2))=400;
                    
                end
            else
                prop(temp(1,1),temp(1,2))=480;
                while ntng==1
                    [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                    if(prop(temp(1,1),temp(1,2))==500)
                        out=1;
                        break;
                    end
                    prop(temp(1,1),temp(1,2))=480;
                    
                end
            end
        end
        if(out==1)
            break;
        end
        if(prop(temp(1,1),temp(1,2))==500)
            if(prop(prev(1,1),prev(1,2))==500)
                break;
            end
             present=prev(1,:);
            prev(1,:)=temp(1,:);
            temp(1,:)=present(1,:);
            prop(temp(1,1),temp(1,2))=450;
             while ntng==1
                [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                if(prop(temp(1,1),temp(1,2))==500)
                    prop(temp(1,1),temp(1,2))=550;
                    out=1;
                    break;
                end
                prop(temp(1,1),temp(1,2))=450;

            end
        end
        if(out==1)
            break;
        end
    end
end

for i=1:no_juncpts-1
    prop(juncpts(i,1),juncpts(i,2))=300;
end

pt_param=ones(3,2);
route=zeros(3,2);
pts_tri=zeros(3,2);
q=1;
ntng=1;
to_travel=10;

for i=1:no_juncpts-1
     neigh=neighbours_junc(juncpts(i,1),juncpts(i,2),I);
     if((prop(neigh(1,1),neigh(1,2))==480&&prop(neigh(2,1),neigh(2,2))==480)||(prop(neigh(1,1),neigh(1,2))==480&&prop(neigh(3,1),neigh(3,2))==480)||(prop(neigh(2,1),neigh(2,2))==480&&prop(neigh(3,1),neigh(3,2))==480)||(prop(neigh(1,1),neigh(1,2))==480&&prop(neigh(2,1),neigh(2,2))==400)||(prop(neigh(1,1),neigh(1,2))==480&&prop(neigh(3,1),neigh(3,2))==400)||(prop(neigh(2,1),neigh(2,2))==480&&prop(neigh(3,1),neigh(3,2))==400)||(prop(neigh(1,1),neigh(1,2))==400&&prop(neigh(2,1),neigh(2,2))==480)||(prop(neigh(1,1),neigh(1,2))==400&&prop(neigh(3,1),neigh(3,2))==480)||(prop(neigh(2,1),neigh(2,2))==400&&prop(neigh(3,1),neigh(3,2))==480))
        prop(juncpts(1,1),juncpts(1,2))=370;
     end
end

%Marking sharp corners
for i=1:no_juncpts-1
    q=1;
    if(prop(juncpts(1,1),juncpts(1,2))~=370)
     if(I(juncpts(i,1)-1,juncpts(i,2))==0&&q<4)
        prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1)-1;
        temp(1,2)=juncpts(i,2);
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
    
     if(I(juncpts(i,1),juncpts(i,2)-1)==0&&q<4)
        prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1);
        temp(1,2)=juncpts(i,2)-1;
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
     if(I(juncpts(i,1),juncpts(i,2)+1)==0&&q<4)
        prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1);
        temp(1,2)=juncpts(i,2)+1;
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==350)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
    
     if(I(juncpts(i,1)+1,juncpts(i,2))==0&&q<4)
        prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1)+1;
        temp(1,2)=juncpts(i,2);
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
      if(I(juncpts(i,1)+1,juncpts(i,2)-1)==0&&q<4&&I(juncpts(i,1)+1,juncpts(i,2))~=0&&I(juncpts(i,1),juncpts(i,2)-1)~=0)
         prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1)+1;
        temp(1,2)=juncpts(i,2)-1;
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
     if(I(juncpts(i,1)+1,juncpts(i,2)+1)==0&&q<4&&I(juncpts(i,1)+1,juncpts(i,2))~=0&&I(juncpts(i,1),juncpts(i,2)+1)~=0)
         prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1)+1;
        temp(1,2)=juncpts(i,2)+1;
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
     if(I(juncpts(i,1)-1,juncpts(i,2)-1)==0&&q<4&&I(juncpts(i,1)-1,juncpts(i,2))~=0&&I(juncpts(i,1),juncpts(i,2)-1)~=0)
        prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1)-1;
        temp(1,2)=juncpts(i,2)-1;
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
     if(I(juncpts(i,1)-1,juncpts(i,2)+1)==0&&q<4&&I(juncpts(i,1)-1,juncpts(i,2))~=0&&I(juncpts(i,1),juncpts(i,2)+1)~=0)
         prev=juncpts(i,:);
        temp(1,1)=juncpts(i,1)-1;
        temp(1,2)=juncpts(i,2)+1;
        travelled=0;
        while ntng==1
            [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
            if(prop(temp(1,1),temp(1,2))==500||travelled==to_travel||prop(temp(1,1),temp(1,2))==300)
                pt_param(q,:)=temp(1,:);
                break;
            end
            travelled=travelled+1;
        end
        q=q+1;
     end
     if(prop(pt_param(1,1),pt_param(1,2))==400||prop(pt_param(2,1),pt_param(2,2))==400||prop(pt_param(3,1),pt_param(3,2))==400||prop(pt_param(1,1),pt_param(1,2))==500||prop(pt_param(2,1),pt_param(2,2))==500||prop(pt_param(3,1),pt_param(3,2))==500||prop(pt_param(1,1),pt_param(1,2))==480||prop(pt_param(2,1),pt_param(2,2))==480||prop(pt_param(3,1),pt_param(3,2))==480)
          q=2;
          no_ends=0;
         for j=1:3
            if(prop(pt_param(j,1),pt_param(j,2))==400||prop(pt_param(j,1),pt_param(j,2))==500)
                pts_tri(1,:)=pt_param(j,:);
                no_ends=no_ends+1;
            else
                pts_tri(q,:)=pt_param(j,:);
                q=q+1;
            end
         end
         if(no_ends==1)
          A=find_length(juncpts(i,1),juncpts(i,2),pts_tri(1,1),pts_tri(1,2));
          B=find_length(juncpts(i,1),juncpts(i,2),pts_tri(2,1),pts_tri(2,2));
          C=find_length(juncpts(i,1),juncpts(i,2),pts_tri(3,1),pts_tri(3,2));
          a=find_length(pts_tri(2,1),pts_tri(2,2),pts_tri(3,1),pts_tri(3,2));
          b=find_length(pts_tri(1,1),pts_tri(1,2),pts_tri(3,1),pts_tri(3,2));
          c=find_length(pts_tri(1,1),pts_tri(1,2),pts_tri(2,1),pts_tri(2,2));
          if(angle(a,B,C)<angle(c,B,A)&&angle(a,B,C)<angle(b,A,C))
              prop(juncpts(i,1),juncpts(i,2))=350;
          end
         else
            prop(juncpts(i,1),juncpts(i,2))=300; 
         end
         
%           prop(juncpts(i,1),juncpts(i,2))=300;%Remove this !!!
     else
         prop(juncpts(i,1),juncpts(i,2))=380;
     end
    end
end

temp=zeros(1,2);
prev=zeros(1,2);
ntng=1;
%Removing open ends
for i=1:no_juncpts-1
    if(prop(juncpts(i,1),juncpts(i,2))==300||prop(juncpts(1,1),juncpts(1,2))==370)
        
         if(prop(juncpts(i,1)-1,juncpts(i,2))==400)
             prev=juncpts(i,:);
           temp(1,1)=juncpts(i,1)-1;
            temp(1,2)=juncpts(i,2);
            I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
            while ntng==1
               
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
                if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end

         if(prop(juncpts(i,1),juncpts(i,2)-1)==400)
             prev=juncpts(i,:);
            temp(1,1)=juncpts(i,1);
            temp(1,2)=juncpts(i,2)-1;
            I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
             while ntng==1
                
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
               if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end
         if(prop(juncpts(i,1),juncpts(i,2)+1)==400)
             prev=juncpts(i,:);
           temp(1,1)=juncpts(i,1);
           temp(1,2)=juncpts(i,2)+1;
           I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
             while ntng==1
               
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
               if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end

         if(prop(juncpts(i,1)+1,juncpts(i,2))==400)
             prev=juncpts(i,:);
            temp(1,1)=juncpts(i,1)+1;
           temp(1,2)=juncpts(i,2);
           I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
             while ntng==1
               
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
               if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end
          if(prop(juncpts(i,1)+1,juncpts(i,2)-1)==400)
              prev=juncpts(i,:);
            temp(1,1)=juncpts(i,1)+1;
            temp(1,2)=juncpts(i,2)-1;
            I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
             while ntng==1
                
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
               if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end
         if(prop(juncpts(i,1)+1,juncpts(i,2)+1)==400)
             prev=juncpts(i,:);
          temp(1,1)=juncpts(i,1)+1;
           temp(1,2)=juncpts(i,2)+1;
           I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
             while ntng==1
              
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
               if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end
         if(prop(juncpts(i,1)-1,juncpts(i,2)-1)==400)
             prev=juncpts(i,:);
            temp(1,1)=juncpts(i,1)-1;
            temp(1,2)=juncpts(i,2)-1;
            I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
             while ntng==1
              
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
               if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end
         if(prop(juncpts(i,1)-1,juncpts(i,2)+1)==400)
             prev=juncpts(i,:);
            temp(1,1)=juncpts(i,1)-1;
            temp(1,2)=juncpts(i,2)+1;
            I(temp(1,1),temp(1,2))=1;
            prop(temp(1,1),temp(1,2))=1;
             while ntng==1
              
               [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
               I(temp(1,1),temp(1,2))=1;
               if(prop(temp(1,1),temp(1,2))==500)
                    I(temp(1,1),temp(1,2))=1;
                    prop(temp(1,1),temp(1,2))=1;
                    break;
                end
               prop(temp(1,1),temp(1,2))=1;
            end
         end
    end
end
 imshow(I);
%imwrite(I,'new_mermaid.png');
count=0;

no_closed_juncpts=1;
no_gen_juncpts=1;
%After removing open ends , changing the prop of junctions
for q=1:no_juncpts-1
    i=juncpts(q,1);
    j=juncpts(q,2);
            done=0;
            %1  Refer to juncpts_cond file for understanding
            if ((I(i-1,j+1)==0)&&(I(i,j-1)==0)&&(I(i+1,j)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&done==0)

               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %2
            if ((I(i-1,j)==0)&&(I(i,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i+1,j)==1)&&(I(i,j+1)==1)&&done==0)
               
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %3
            if ((I(i-1,j)==0)&&(I(i,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
               
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %4
            if ((I(i-1,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==0)&&(I(i-1,j)==1)&&(I(i,j-1)==1)&&done==0)
                
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %5
            if ((I(i-1,j-1)==0)&&(I(i-1,j+1)==0)&&(I(i+1,j+1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
                 
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %6
            if((I(i-1,j-1)==0)&&(I(i-1,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
              
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %7
            if ((I(i-1,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
               
              if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %8
            if ((I(i-1,j-1)==0)&&(I(i+1,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i-1,j)==1)&&(I(i,j+1)==1)&&(I(i,j-1)==1)&&(I(i+1,j)==1)&&done==0)
               
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %9
            if ((I(i-1,j)==0)&&(I(i,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==1)&&done==0)
                 
               done=1;
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
            end
            %10
            if ((I(i-1,j)==0)&&(I(i,j-1)==0)&&(I(i+1,j)==0)&&(I(i,j+1)==1)&&done==0)
                
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %11
            if ((I(i,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==0)&&(I(i-1,j)==1)&&done==0)
               
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %12
            if ((I(i-1,j)==0)&&(I(i,j+1)==0)&&(I(i+1,j)==0)&&(I(i,j-1)==1)&&done==0)
              
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %13
            if ((I(i-1,j)==0)&&(I(i+1,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j)==1)&&done==0)
                
              if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %14
            if ((I(i-1,j+1)==0)&&(I(i,j-1)==0)&&(I(i+1,j+1)==0)&&(I(i,j+1)==1)&&(I(i-1,j)==1)&&(I(i+1,j)==1)&&done==0)
               
              if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
            end
            %15
             if ((I(i-1,j-1)==0)&&(I(i-1,j+1)==0)&&(I(i+1,j)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i-1,j)==1)&&done==0)
                
              if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
             end
             %16
             if ((I(i-1,j-1)==0)&&(I(i,j+1)==0)&&(I(i+1,j-1)==0)&&(I(i,j-1)==1)&&(I(i-1,j)==1)&&(I(i+1,j)==1)&&done==0)
                
               if(prop(i,j)~=380&&prop(i,j)~=350)
                   prop(i,j)=300;
               end
               done=1;
             end
             %the junctions whose both the arms were removed in the
             %previous step become end points
            if(done==0)
                   %finding end points
            if (I(i-1,j-1)==0)&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&(I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1;  
                 prop(i,j)=500;
                 done=1;
            end
            
            if ((I(i-1,j)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1;   
                  prop(i,j)=500;
                  done=1;
            end
            
            if (I(i-1,j-1)==1)&&(I(i-1,j)==1)&&(I(i-1,j+1)==0)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&(I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
                  done=1;
            end
            
            if ((I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==0)&&(I(i,j+1)==1)&&(I(i+1,j)==1)&&I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
                  done=1;
            end
            
            if (I(i-1,j-1)==1&&(I(i-1,j)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==0)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1))
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1;  
                  prop(i,j)=500;
                  done=1;
            end
            
            if (I(i-1,j-1)==1)&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==0)&&(I(i+1,j)==1)&&(I(i+1,j+1)==1)
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
                  done=1;
            end
            
            if (I(i-1,j-1)==1&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j)==0))
                endpts(no_endpts,1)=i;
                 endpts(no_endpts,2)=j;
                 no_endpts=no_endpts+1; 
                  prop(i,j)=500;
                  done=1;
            end
            
            if (I(i-1,j-1)==1)&&(I(i-1,j)==1)&&(I(i-1,j+1)==1)&&(I(i,j-1)==1)&&(I(i,j+1)==1)&&(I(i+1,j-1)==1)&&(I(i+1,j)==1)&&(I(i+1,j+1)==0)
                endpts(no_endpts,1)=i;
                endpts(no_endpts,2)=j;
                no_endpts=no_endpts+1;   
                 prop(i,j)=500;
                 done=1;
            end
            %If its just a part of curve 
            if(done==0)
                prop(i,j)=0;
            end
            end
           
end
%Storing the closed , gen and sharp junc pts into an array
%By gen junc pts i mean the ones which are not sharp corners but their open
%end is not removed because of parameter
for i=1:size(I,1)
    for j=1:size(I,2)
        if(prop(i,j)==380)
            closed_juncpts(no_closed_juncpts,1)=i;
            closed_juncpts(no_closed_juncpts,2)=j; 
            no_closed_juncpts=no_closed_juncpts+1;
        end
        if(prop(i,j)==300||prop(i,j)==350)
            gen_juncpts(no_gen_juncpts,1)=i;
           gen_juncpts(no_gen_juncpts,2)=j; 
            no_gen_juncpts=no_gen_juncpts+1;
        end
    end
end
count=0;
no_splines=0;
l=1;
no_moved=0;

%smoothening curve between closed junction points
for i=1:no_closed_juncpts-1

       neigh=neighbours_junc(closed_juncpts(i,1),closed_juncpts(i,2),I);
        count=0;
    for j=1:3
        no_moved=0;
        if(prop(neigh(j,1),neigh(j,2))~=600)
            prop(neigh(j,1),neigh(j,2))=600;
            no_splines=no_splines+1;
            count=count+1;
            cntrl_pts(no_splines,count,:)=closed_juncpts(i,:);
            count=count+1;
            prev(1,1)=closed_juncpts(i,1);
            prev(1,2)=closed_juncpts(i,2);
            temp(1,1)=neigh(j,1);
            temp(1,2)=neigh(j,2);
            start_point=closed_juncpts(i,:);
            while ntng==1
               if(prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==550)
                   cntrl_pts(no_splines,count,:)=temp(1,:);
                   no_cntrl_pts(no_splines)=count;
                   count=0;
                    if(prop(temp(1,1),temp(1,2))==500)
                               prop(temp(1,1),temp(1,2))=600;
                    end
                   break;
               end
                if(prop(temp(1,1),temp(1,2))==350)
                          neigh=neighbours_junc(temp(1,1),temp(1,2),I);
                          
                            for k=1:3
                                if(prop(neigh(k,1),neigh(k,2))==480)
                                    cntrl_pts(no_splines,count,:)=temp(1,:);
                                    no_cntrl_pts(no_splines)=count;
                                    count=0;
                                    break;
                                end
                                if(prop(neigh(k,1),neigh(k,2))==400)
                                    prev(1,:)=temp(1,:);
                                    temp(1,:)=neigh(k,:);
                                    while ntng==1
                                        if(prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==600)
                                           cntrl_pts(no_splines,count,:)=temp(1,:);
                                           no_cntrl_pts(no_splines)=count;
                                           count=0;
                                           if(prop(temp(1,1),temp(1,2))==500)
                                               prop(temp(1,1),temp(1,2))=600;
                                           end
                                           break;
                                        end
                                        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                                        prop(prev(1,1),prev(1,2))=600;
                                    end
                                end
                            end
                            break;
                end
              [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
              no_moved=no_moved+1;
               if(prop(prev(1,1),prev(1,2))~=650)
                prop(prev(1,1),prev(1,2))=600;
               end
               
               if(prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==550)
                   cntrl_pts(no_splines,count,:)=temp(1,:);
                   no_cntrl_pts(no_splines)=count;
                   count=0;
                    if(prop(temp(1,1),temp(1,2))==500)
                               prop(temp(1,1),temp(1,2))=600;
                    end
                   break;
               end
                if(prop(temp(1,1),temp(1,2))==350)
                          neigh=neighbours_junc(temp(1,1),temp(1,2),I);
                            for k=1:3
                                if(prop(neigh(k,1),neigh(k,2))==400)
                                    prev(1,:)=temp(1,:);
                                    temp(1,:)=neigh(k,:);
                                    while ntng==1
                                        if(prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==600)
                                           cntrl_pts(no_splines,count,:)=temp(1,:);
                                           no_cntrl_pts(no_splines)=count;
                                           count=0;
                                           if(prop(temp(1,1),temp(1,2))==500)
                                               prop(temp(1,1),temp(1,2))=600;
                                           end
                                           break;
                                        end
                                        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                                        
                                    end
                                end
                            end
                             neigh=neighbours_junc(closed_juncpts(i,1),closed_juncpts(i,2),I);
                            break;
                       end
              while ntng==1
                  if(no_moved==no_to_move)
                     start_point=temp(1,:);
                     cntrl_pts(no_splines,count,:)=temp(1,:);
                     prop(temp(1,1),temp(1,2))=650;
                     count=count+1;
                     no_moved=0;
                      l=1;
                     break;
                    
                  end
                 check=move_direc(start_point(1,1),start_point(1,2),temp(1,1),temp(1,2),l);
                 l=l+1;
                 if(J(check(1,1),check(1,2))==1)
                     start_point=temp(1,:);
                     cntrl_pts(no_splines,count,:)=temp(1,:);
                     prop(temp(1,1),temp(1,2))=650;
                     count=count+1;
                     l=1;
                     break;
                 end
                 if(check(1,1)==temp(1,1)&&check(1,2)==temp(1,2))
                     l=1;
                     break;
                 end
              end
            end
         end
    end
end
%smoothening curve between gen junction pts (sharp corners also)
no_moved=0;
for i=1:no_gen_juncpts-1
    neigh=neighbours_junc(gen_juncpts(i,1),gen_juncpts(i,2),I);
        if(prop(gen_juncpts(i,1),gen_juncpts(i,2))==350)
            for j=1:3
                if(prop(neigh(j,1),neigh(j,2))==400)
                    temp(1,:)=neigh(j,:);
                    prev(1,:)=gen_juncpts(i,:);
                    while ntng==1
                        if(prop(temp(1,1),temp(1,2))==500)
                            start_point=temp(1,:);
                            prop(temp(1,1),temp(1,2))=600;
                            break;
                        end
                        if(prop(temp(1,1),temp(1,2))==600)
                            start_point=gen_juncpts(i,:);
                            break;
                        end
                        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                    end
                end
            end
            for j=1:3
                if(prop(neigh(j,1),neigh(j,2))~=600&&prop(neigh(j,1),neigh(j,2))~=400&&prop(neigh(j,1),neigh(j,2))~=650)
                    no_moved=0;
                    prop(neigh(j,1),neigh(j,2))=600;
                    no_splines=no_splines+1;
                    count=count+1;
                    cntrl_pts(no_splines,count,:)=start_point(1,:);
                    count=count+1;
                    prev(1,1)=gen_juncpts(i,1);
                    prev(1,2)=gen_juncpts(i,2);
                    temp(1,1)=neigh(j,1);
                    temp(1,2)=neigh(j,2);
                    while ntng==1
                       if(prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==550)
                           cntrl_pts(no_splines,count,:)=temp(1,:);
                           no_cntrl_pts(no_splines)=count;
                           count=0;
                          
                           if(prop(temp(1,1),temp(1,2))==500)
                               prop(temp(1,1),temp(1,2))=600;
                           end
                           break;
                       end
                       if(prop(temp(1,1),temp(1,2))==350)
                          neigh=neighbours_junc(temp(1,1),temp(1,2),I);
                            for k=1:3
                                if(prop(neigh(k,1),neigh(k,2))==400)
                                    prev(1,:)=temp(1,:);
                                    temp(1,:)=neigh(k,:);
                                    while ntng==1
                                        if(prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==600)
                                           cntrl_pts(no_splines,count,:)=temp(1,:);
                                           no_cntrl_pts(no_splines)=count;
                                           count=0;
                                           if(prop(temp(1,1),temp(1,2))==500)
                                               prop(temp(1,1),temp(1,2))=600;
                                           end
                                           break;
                                        end
                                        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                                    end
                                end
                            end
                            break;
                             neigh=neighbours_junc(gen_juncpts(i,1),gen_juncpts(i,2),I);
                       end
                      [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                      no_moved=no_moved+1;
                       if(prop(prev(1,1),prev(1,2))~=650)
                        prop(prev(1,1),prev(1,2))=600;
                       end

                       if(prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==550)
                           cntrl_pts(no_splines,count,:)=temp(1,:);
                           no_cntrl_pts(no_splines)=count;
                           count=0;
                          
                           if(prop(temp(1,1),temp(1,2))==500)
                               prop(temp(1,1),temp(1,2))=600;
                           end
                           break;
                       end
                        if(prop(temp(1,1),temp(1,2))==350)
                          neigh=neighbours_junc(temp(1,1),temp(1,2),I);
                            for k=1:3
                                if(prop(neigh(k,1),neigh(k,2))==400)
                                    prev(1,:)=temp(1,:);
                                    temp(1,:)=neigh(k,:);
                                    while ntng==1
                                        if(prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==600)
                                           cntrl_pts(no_splines,count,:)=temp(1,:);
                                           no_cntrl_pts(no_splines)=count;
                                           count=0;
                                           if(prop(temp(1,1),temp(1,2))==500)
                                               prop(temp(1,1),temp(1,2))=600;
                                           end
                                           break;
                                        end
                                        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                                    end
                                end
                            end
                            break;
                             neigh=neighbours_junc(gen_juncpts(i,1),gen_juncpts(i,2),I);
                       end
                      while ntng==1
                              if(no_moved==no_to_move)
                                  start_point=temp(1,:);
                                  cntrl_pts(no_splines,count,:)=temp(1,:);
                                  prop(temp(1,1),temp(1,2))=650;
                                  count=count+1;
                                  no_moved=0;
                                  l=1;
                                  break;

                              end
                         check=move_direc(start_point(1,1),start_point(1,2),temp(1,1),temp(1,2),l);
                         l=l+1;
                         if(J(check(1,1),check(1,2))==1)
                             start_point=temp(1,:);
                             cntrl_pts(no_splines,count,:)=temp(1,:);
                             prop(temp(1,1),temp(1,2))=650;
                             count=count+1;
                             l=1;
                             break;
                         end
                         if(check(1,1)==temp(1,1)&&check(1,2)==temp(1,2))
                             l=1;
                             break;
                         end
                      end
                    end
                 end
    
            end
        else
            for j=1:3
                no_moved=0;
                if(prop(neigh(j,1),neigh(j,2))~=600&&prop(neigh(j,1),neigh(j,2))~=650)
                    prop(neigh(j,1),neigh(j,2))=600;
                    no_splines=no_splines+1;
                    count=count+1;
                    cntrl_pts(no_splines,count,:)=gen_juncpts(i,:);
                    count=count+1;
                    prev(1,1)=gen_juncpts(i,1);
                    prev(1,2)=gen_juncpts(i,2);
                    temp(1,1)=neigh(j,1);
                    temp(1,2)=neigh(j,2);
                    start_point=gen_juncpts(i,:);
                    while ntng==1
                       if(prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==550)
                           cntrl_pts(no_splines,count,:)=temp(1,:);
                           no_cntrl_pts(no_splines)=count;
                           count=0;
                           
                           if(prop(temp(1,1),temp(1,2))==500)
                               prop(temp(1,1),temp(1,2))=600;
                           end
                           break;
                       end
                        if(prop(temp(1,1),temp(1,2))==350)
                          neigh=neighbours_junc(temp(1,1),temp(1,2),I);
                            for k=1:3
                                if(prop(neigh(k,1),neigh(k,2))==400)
                                    prev(1,:)=temp(1,:);
                                    temp(1,:)=neigh(k,:);
                                    while ntng==1
                                        if(prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==600)
                                           cntrl_pts(no_splines,count,:)=temp(1,:);
                                           no_cntrl_pts(no_splines)=count;
                                           count=0;
                                           if(prop(temp(1,1),temp(1,2))==500)
                                               prop(temp(1,1),temp(1,2))=600;
                                           end
                                           break;
                                        end
                                        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                                    end
                                end
                            end
                            break;
                             neigh=neighbours_junc(gen_juncpts(i,1),gen_juncpts(i,2),I);
                       end
                      [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                      no_moved=no_moved+1;
                       if(prop(prev(1,1),prev(1,2))~=650)
                        prop(prev(1,1),prev(1,2))=600;
                       end

                       if(prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==550||prop(temp(1,1),temp(1,2))==650)
                           cntrl_pts(no_splines,count,:)=temp(1,:);
                           no_cntrl_pts(no_splines)=count;
                           count=0;
                            
                           if(prop(temp(1,1),temp(1,2))==500)
                               prop(temp(1,1),temp(1,2))=600;
                           end
                           break;
                       end
                        if(prop(temp(1,1),temp(1,2))==350)
                          neigh=neighbours_junc(temp(1,1),temp(1,2),I);
                            for k=1:3
                                if(prop(neigh(k,1),neigh(k,2))==400)
                                    prev(1,:)=temp(1,:);
                                    temp(1,:)=neigh(k,:);
                                    while ntng==1
                                        if(prop(temp(1,1),temp(1,2))==500||prop(temp(1,1),temp(1,2))==600)
                                           cntrl_pts(no_splines,count,:)=temp(1,:);
                                           no_cntrl_pts(no_splines)=count;
                                           count=0;
                                           if(prop(temp(1,1),temp(1,2))==500)
                                               prop(temp(1,1),temp(1,2))=600;
                                           end
                                           break;
                                        end
                                        [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                                    end
                                end
                            end
                            break;
                             neigh=neighbours_junc(gen_juncpts(i,1),gen_juncpts(i,2),I);
                       end
                      while ntng==1
                          if(no_moved==no_to_move)
                              start_point=temp(1,:);
                              cntrl_pts(no_splines,count,:)=temp(1,:);
                              prop(temp(1,1),temp(1,2))=650;
                              count=count+1;
                              no_moved=0;
                              l=1;
                              break;
                              
                          end
                         check=move_direc(start_point(1,1),start_point(1,2),temp(1,1),temp(1,2),l);
                         l=l+1;
                         if(J(check(1,1),check(1,2))==1)
                             start_point=temp(1,:);
                             cntrl_pts(no_splines,count,:)=temp(1,:);
                             prop(temp(1,1),temp(1,2))=650;
                             count=count+1;
                             l=1;
                             break;
                         end
                         if(check(1,1)==temp(1,1)&&check(1,2)==temp(1,2))
                             l=1;
                             break;
                         end
                      end
                    end
                 end
            end
        end
        
   
end

l=1;
no_moved=0;
for i=1:size(I,1)
    for j=1:size(I,2)
        if(prop(i,j)==500)
                 no_splines=no_splines+1;
                count=count+1;
                cntrl_pts(no_splines,count,:)=[i j];
                count=count+1;
                prev=[i j];
                prop(i,j)=600;
                start_point=[i j];
                done=0;
                if(I(i-1,j-1)==0&&done==0)
                    temp=[i-1 j-1];
                    done=1;
                end
                if(I(i-1,j)==0&&done==0)
                    temp=[i-1 j];
                    done=1;
                end
                if(I(i-1,j+1)==0&&done==0)
                    temp=[i-1 j+1];
                    done=1;
                end
                if(I(i,j-1)==0&&done==0)
                    temp=[i j-1];
                    done=1;
                end
                if(I(i,j+1)==0&&done==0)
                    temp=[i j+1];
                    done=1;
                end
                if(I(i+1,j-1)==0&&done==0)
                    temp=[i+1 j-1];
                    done=1;
                end
                if(I(i+1,j)==0&&done==0)
                    temp=[i+1 j];
                    done=1;
                end
                if(I(i+1,j+1)==0&&done==0)
                   temp=[i+1 j+1];
                    done=1;
                end
                while ntng==1

                   if(prop(temp(1,1),temp(1,2))==550||prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300)
                       cntrl_pts(no_splines,count,:)=temp(1,:);
                       no_cntrl_pts(no_splines)=count;
                       count=0;
                       prop(temp(1,1),temp(1,2))=650;
                       break;
                   end
                  [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
                  no_moved=no_moved+1;
                  if(prop(temp(1,1),temp(1,2))==550||prop(temp(1,1),temp(1,2))==380||prop(temp(1,1),temp(1,2))==300||prop(temp(1,1),temp(1,2))==650||prop(temp(1,1),temp(1,2))==500)
                       cntrl_pts(no_splines,count,:)=temp(1,:);
                       no_cntrl_pts(no_splines)=count;
                       count=0;
                       prop(temp(1,1),temp(1,2))=650;
                       break;
                  end
                   if(prop(temp(1,1),temp(1,2))==600)
                   break;
                   end
                   if(prop(prev(1,1),prev(1,2))~=650)
                    prop(prev(1,1),prev(1,2))=600;
                   end

                  while ntng==1
                      if(no_moved==no_to_move)
                         start_point=temp(1,:);
                         cntrl_pts(no_splines,count,:)=temp(1,:);
                         prop(temp(1,1),temp(1,2))=650;
                         count=count+1;
                         no_moved=0;
                          l=1;
                         break;

                      end
                     check=move_direc(start_point(1,1),start_point(1,2),temp(1,1),temp(1,2),l);
                     l=l+1;
                     if(J(check(1,1),check(1,2))==1)
                         start_point=temp(1,:);
                         cntrl_pts(no_splines,count,:)=temp(1,:);
                         if(prop(temp(1,1),temp(1,2))~=550&&prop(temp(1,1),temp(1,2))~=350&&prop(temp(1,1),temp(1,2))~=380&&prop(temp(1,1),temp(1,2))~=300)
                          prop(temp(1,1),temp(1,2))=650;
                         end
                         count=count+1;
                         l=1;
                         break;
                     end
                     if(check(1,1)==temp(1,1)&&check(1,2)==temp(1,2))
                         l=1;
                         break;
                     end
                  end
                end
        end
    end
end
l=1;
no_moved=0;
for i=1:size(I,1)
    for j=1:size(I,2)
        if(prop(i,j)==0)
            no_splines=no_splines+1;
            count=count+1;
            cntrl_pts(no_splines,count,:)=[i j];
            count=count+1;
            alpha_pt=[i j];
            temp=[i j];
            prop(i,j)=600;
            done=0;
            start_point=[i j];
            
            if(I(i-1,j-1)==0&&done==0)
                prev=[i-1 j-1];
                done=1;
            end
            if(I(i-1,j)==0&&done==0)
                prev=[i-1 j];
                done=1;
            end
            if(I(i-1,j+1)==0&&done==0)
                prev=[i-1 j+1];
                done=1;
            end
            if(I(i,j-1)==0&&done==0)
                prev=[i j-1];
                done=1;
            end
            if(I(i,j+1)==0&&done==0)
                prev=[i j+1];
                done=1;
            end
            if(I(i+1,j-1)==0&&done==0)
                prev=[i+1 j-1];
                done=1;
            end
            if(I(i+1,j)==0&&done==0)
                prev=[i+1 j];
                done=1;
            end
            if(I(i+1,j+1)==0&&done==0)
                prev=[i+1 j+1];
                done=1;
            end
            
             while ntng==1

               
              [temp,prev]=flow_1D(I,temp(1,1),temp(1,2),prev(1,1),prev(1,2),1);
              no_moved=no_moved+1;
              if(temp(1,1)==alpha_pt(1,1)&&temp(1,2)==alpha_pt(1,2)||prop(temp(1,1),temp(1,2))==650)
                   cntrl_pts(no_splines,count,:)=temp(1,:);
                   no_cntrl_pts(no_splines)=count;
                   count=0;
                   prop(prev(1,1),prev(1,2))=600;
                   break;
               end
               if(prop(prev(1,1),prev(1,2))~=650)
                prop(prev(1,1),prev(1,2))=600;
               end
               
              while ntng==1
                  if(no_moved==no_to_move)
                     start_point=temp(1,:);
                     cntrl_pts(no_splines,count,:)=temp(1,:);
                     prop(temp(1,1),temp(1,2))=650;
                     count=count+1;
                     no_moved=0;
                      l=1;
                     break;
                    
                  end
                 check=move_direc(start_point(1,1),start_point(1,2),temp(1,1),temp(1,2),l);
                 l=l+1;
                 if(J(check(1,1),check(1,2))==1)
                     start_point=temp(1,:);
                     cntrl_pts(no_splines,count,:)=temp(1,:);
                     if(prop(temp(1,1),temp(1,2))~=550&&prop(temp(1,1),temp(1,2))~=350&&prop(temp(1,1),temp(1,2))~=380&&prop(temp(1,1),temp(1,2))~=300)
                      prop(temp(1,1),temp(1,2))=650;
                     end
                     count=count+1;
                     l=1;
                     break;
                 end
                 if(check(1,1)==temp(1,1)&&check(1,2)==temp(1,2))
                     l=1;
                     break;
                 end
              end
            end
        end
        
    end
end

fileid=fopen('cntrlpts.txt','w');
 l=-10;
for i=1:no_splines

    if(no_cntrl_pts(i)~=0)    
         fprintf(fileid,'%i\t%i\n',l,l);
    
        for j=1:no_cntrl_pts(i)
            if(cntrl_pts(i,j,1)==0&&cntrl_pts(i,j,2)==0)    
    
            end
               fprintf(fileid,'%d\t%d\n',cntrl_pts(i,j,1),cntrl_pts(i,j,2));
        end
    end
end
fileid1=fopen('cntrlpts_svg1.txt','w');
fprintf(fileid1,'<svg height="2000" width="2000"> \n\n');
flag=0;

for i=1:no_splines
     if(no_cntrl_pts(i)~=0)
     fprintf(fileid1,'<path d="M %d %d Q ',cntrl_pts(i,1,1),cntrl_pts(i,1,2));
     flag=0;
     if(no_cntrl_pts(i)>=3)
            for j=2:no_cntrl_pts(i)-2
       
                     fprintf(fileid1,'%d %d ',cntrl_pts(i,j,1),cntrl_pts(i,j,2));
                     fprintf(fileid1,'%d %d ',(cntrl_pts(i,j+1,1)+cntrl_pts(i,j,1))/2,(cntrl_pts(i,j+1,2)+cntrl_pts(i,j,2))/2);
                     
                     
            end
             fprintf(fileid1,'%d %d ',cntrl_pts(i,no_cntrl_pts(i)-1,1),cntrl_pts(i,no_cntrl_pts(i)-1,2));
            fprintf(fileid1,'%d %d ',cntrl_pts(i,no_cntrl_pts(i),1),cntrl_pts(i,no_cntrl_pts(i),2));
                     
            fprintf(fileid1,'" stroke="black" stroke-width="5" fill="none" />\n');

     end
     if(no_cntrl_pts(i)==2)
         fprintf(fileid1,'%d %d ',cntrl_pts(i,2,1),cntrl_pts(i,2,2));
         fprintf(fileid1,'%d %d ',cntrl_pts(i,2,1),cntrl_pts(i,2,2));
         
          fprintf(fileid1,'" stroke="black" stroke-width="5" fill="none" />\n');
     end
     end
end
fprintf(fileid1,'</svg>');
