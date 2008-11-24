From: rossella battaglia <roxen_b@yahoo.it>
Date: Mon, 24 Nov 2008 12:25:04 +0000 (GMT)
Subject: [Buildroot] (no subject)
Message-ID: <803682.81697.qm@web23101.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer schrieb:
> On Mon, Jan 21, 2008 at 05:20:43PM +0100, Joe wrote:
>> Hi all!
>>
>> Today I tried to build a new kernel for my dev-board. Last time i did 
>> this was Nov 2007, when i also used a buildroot-created toolchain which 
>> worked absolutely fine. Today it compiles a lot, and then backs out with
>>
>> "arm-linux-ld: no machine record defined" in the file .tmp_vmlinux1
>>
>> After googling a lot, i found some messages including one by Russell 
>> King indicating that there is probably something wrong with the used 
>> binutils and that it should be reported to the binutils people. But 
>> because i used the buildroot chain, i thought i'd ask here first.
>> Tried combinations include gcc 4.2.1 and 4.1.2 as well as binutils 2.18 
>> and 2.17 on kernels 2.6.22.10 and 2.6.23.14. Every possible combination 
>> was given a try with the same results.
>>
>> Are there any ideas on this?
> 
> Please send me your buildroot.config and (if it's not the default) your
> uClibc.config and kernel.config for me to reproduce.
> 

Thanks for the quick reply, Bernhard.

Please find the buildroot and kernel configs attached, uclibc config is 
standard with buildroot latest revision for svn.

Greetz Joe

Hi Joe,
I have the same problem. Could you help me, please?




      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081124/e32a0c56/attachment.htm 
