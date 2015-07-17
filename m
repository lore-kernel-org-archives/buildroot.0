From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 17 Jul 2015 10:47:24 -0700
Subject: [Buildroot] multiple BR2_EXTERNAL layers?
In-Reply-To: <20150717164612.GA3637@free.fr>
References: <55A92BE5.8060307@mentor.com> <20150717164612.GA3637@free.fr>
Message-ID: <55A93FAC.2040705@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/2015 09:46 AM, Yann E. MORIN wrote:
> On 2015-07-17 09:23 -0700, Hollis Blanchard spake thusly:
>> My team has a bunch of testcases in separate directories. Many of 
>> these use simple bare metal executables, but some include Linux. I 
>> would like to adopt Buildroot, but keep testcase-specific bits (Linux 
>> config files, device trees, etc) in its own directory. At the same 
>> time, some components (e.g. test applications) should be shared 
>> across testcases. So I want to use BR2_EXTERNAL="/project/testcase 
>> /project/shared", but that doesn't seem to be possible right now...? 
> Indeed no... However, I have already posted a patch series that does 
> implement support for multiple br2-external trees. It is not finished 
> yet (i.e. it is in a rather rough state) but works. The project has 
> not decided yet if we wanted to support multiple br2-external trees. 
> We have to talk about it a bit more. But your message is a clear 
> indication that there is a need, and that I'm not the only one with 
> that need. Please have a look at the series I posted, test it and 
> report on the list whether it Works For You (TM). Also, voice your 
> opinion on the cover-letter (having more than a single user (me) with 
> the same need will give weight to the proposal).

OK, thanks for the background. I will try to take a look at your series. 
In the meantime though, I think I can put the shared content in a local 
branch, and use BR2_EXTERNAL for testcase-specific content. I will 
explore that first.

Hollis Blanchard
Mentor Graphics Emulation Division
