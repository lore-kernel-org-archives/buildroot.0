From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 07 Sep 2019 21:51:31 -0300
Subject: [Buildroot] Notifications of defconfig and runtime test failures
References: <20190907082044.3c46f9e0@windsurf>
Message-ID: <5d74509312f3_12263fea580e4f704771@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Sep 07, 2019 at 03:20 AM, Thomas Petazzoni wrote:

[snip]

>> Detail of runtime-test failures
>> -------------------------------
>> 
>>              runtime-test |                        link to the job                        | orph?
>> --------------------------+---------------------------------------------------------------+------
>> ...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126471  | ORPH 
>> ...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126473  | ORPH 
>> ...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126475  | ORPH 
>> ...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126476  | ORPH 
>> ...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126477  | ORPH 
>>              TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126581  | ORPH 
> 
> As you can see in this daily e-mail, we are now reporting not only
> autobuilder failures, but also defconfig failures and runtime test
> failures. This is another thing that was implemented by Victor Huesca
> as part of his internship at Bootlin.

Great!

> Just like the autobuilder failures, the defconfig and runtime test
> failures are not only all reported to the mailing list, they are also
> reported individually to each developer who is listed in the DEVELOPERS
> file for a given defconfig or runtime test.

I have this entry in DEVELOPERS files:
F:	support/testing/
But I did not receive a "Your daily results" e-mail and also the runtime tests
are marked as ORPH.
Of course it's a minor issue.
Should I change my entry to explicitly list a bunch of tests, each one like
this?
F:	support/testing/tests/package/test_syslog_ng.py


Regards,
Ricardo
