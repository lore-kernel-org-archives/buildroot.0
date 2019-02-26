From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 26 Feb 2019 00:07:22 -0300
Subject: [Buildroot] Runtime test issues
References: <20190222214646.03209aba@windsurf>
Message-ID: <5c74ad6a36b1e_6aa42b0b26e4b3c4906b9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Feb 22, 2019 at 05:46 PM, Thomas Petazzoni wrote:

>> Ricardo, the following test is failing:
>> 
>>  - tests.download.test_git.TestGitRefs
>>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295269
> 
> Ricardo, I saw you discussed this issue with Arnout. Any conclusion ?

Let's remove for now the part of the test case that checks special refs.
I just sent a patch:
http://patchwork.ozlabs.org/patch/1048062/


Regards,
Ricardo
