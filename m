From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Nov 2020 20:07:21 +0100
Subject: [Buildroot] [2020.02.x] package/busybox: fix build with glibc
 2.31
In-Reply-To: <CANQCQpZ5xzOATqBxQrJRhR159LuwFA37eYuK2keTiS=fNzutKQ@mail.gmail.com>
 (Matthew Weber's message of "Mon, 2 Nov 2020 06:06:07 -0600")
References: <CANQCQpZvbwcpdhXsE90HUS10fmZrOtbeGAA82rMUWmUZnd0LGg@mail.gmail.com>
 <CANQCQpZ5xzOATqBxQrJRhR159LuwFA37eYuK2keTiS=fNzutKQ@mail.gmail.com>
Message-ID: <87blgfbms6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Peter / Thomas / Yann / Arnout,
 > On Thu, Oct 29, 2020 at 9:04 AM Matthew Weber
 > <matthew.weber@rockwellcollins.com> wrote:
 >> 
 >> Peter,
 >> 

 > [snip]

 >> Note: I'll have additional individual patches coming for openssh and
 >> strace as those were fixed for a similar issue but through version
 >> bumps on master.  Is there some backstory (beyond the patchwork
 >> submissions for master) on other attempts to bring glibc 2.31 support
 >> to LTS?
 >> 

 > Wondering about your thoughts on adding GLIBC 2.3.1 support to the
 > 2020.02 LTS.  Technically, we believe that the patches that need
 > cherry picked over from master are the following.  What do you guys
 > think?  Should we pull out the individual commits within those
 > projects(more patches in Buildroot) or are these (strace/openssh)
 > bumps OK?

But what is the reason for wanting to support glibc 2.31 in LTS? Is
there anything important added in 2.31 or do you have an external glibc
2.31 based toolchain you really have to use?

-- 
Bye, Peter Korsgaard
