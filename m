From: Christian Stewart <christian@paral.in>
Date: Sat, 07 Dec 2019 14:50:12 -0800
Subject: [Buildroot] [PATCH v1 3/4] package/docker-engine: bump to
 19.03.5
In-Reply-To: <20191204085229.56064f6c@windsurf>
References: <20191203045003.145746-1-christian@paral.in>
 <20191203045003.145746-3-christian@paral.in>
 <20191203085731.6d12aa82@windsurf>
 <CA+h8R2rKKbJbg2-BEOekcs2en+rf-TPkakmvN6_Oc+FQNe-KiA@mail.gmail.com>
 <20191204085229.56064f6c@windsurf>
Message-ID: <87fthvzr6j.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> On Tue, 3 Dec 2019 18:18:21 -0800
> Christian Stewart <christian@paral.in> wrote:
>
>> > A quick question: did you check that the test_docker_compose.py test we
>> > have in Buildroot continues to work with this series applied ?  

I have now and they passed.

> To run it:
>
>  ./support/testing/run-tests -k tests.package.test_docker_compose.TestDockerCompose

# 14:44:09 TestDockerCompose                        Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 51.830s

OK

Best regards,
Christian
