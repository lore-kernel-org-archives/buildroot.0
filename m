From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 15:34:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-15
In-Reply-To: <CAOMZO5Bprz=r4+N5tZnp+X09GOO2XOwmpuufuS48T7M3rDQd7g@mail.gmail.com>
References: <5dcfa2a9.1c69fb81.7eabb.0dddSMTPIN_ADDED_MISSING@mx.google.com>
 <CAOMZO5Bprz=r4+N5tZnp+X09GOO2XOwmpuufuS48T7M3rDQd7g@mail.gmail.com>
Message-ID: <cabce95f-bd6c-b7eb-33a3-2cc9f1945594@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/11/2019 13:14, Fabio Estevam wrote:
> Hi Thomas and Arnout,
> 
> On Sat, Nov 16, 2019 at 4:18 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> 
>> Build failures related to your defconfigs:
>>
>>                         defconfig |                        link to the job
>> ----------------------------------+--------------------------------------------------------------
>>                  imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579609
> 
> Received this report for the second time.
> 
> The build is taking more than 6 hours.

 I'm trying to debug it, but there's not much information available after the
fact...

 It could be a real timeout, because there are 4 runners going in parallel on
that machine (which has 32 cores).

 The annoying thing is that artifacts aren't uploaded if the build times out...
And even the log is not complete - because of the output filtering we do, the
output is buffered and the last bit isn't there yet.

 So, indeed, not much we can do except to ignore the failure :-(

 Any ideas to improve the reliability of our tests are very welcome!

 Regards,
 Arnout
