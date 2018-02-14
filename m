From: Christian Stewart <christian@paral.in>
Date: Tue, 13 Feb 2018 21:55:40 -0500
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <874lo9xqb7.fsf@paral.in>
References: <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de> <87po73d1xz.fsf@paral.in>
 <20171225151337.GC27558@waldemar-brodkorb.de> <87mv25cg5t.fsf@paral.in>
 <87shbxq99x.fsf@paral.in> <20171227030548.GE27558@waldemar-brodkorb.de>
 <87y3loenlr.fsf@paral.in> <20171227080520.GF27558@waldemar-brodkorb.de>
 <87o9mkdlf1.fsf@paral.in> <20171228180402.GR27558@waldemar-brodkorb.de>
 <874lo9xqb7.fsf@paral.in>
Message-ID: <87wozgz3df.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar, all,


Christian Stewart <christian@paral.in> writes:
> Waldemar Brodkorb <wbx@openadk.org> writes:
>>> Thank you again for taking the time to debug this, I've had this issue
>>> early 2017 and have avoided upgrading Buildroot until we find a fix.
>>
>> Sorry I believe you entered the world of libtool hell.
>>
>> For the hardcore buildroot hackers, if you create a symlink in /lib
>> pointing to libpam.so / libpam_misc.so you can reproduce the issue.

It appears that this bug is fixed in the latest release (2018.02 rc2).

Thanks!
Christian
