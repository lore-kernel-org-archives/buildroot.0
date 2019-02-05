From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 10:48:18 +0100
Subject: [Buildroot] [PATCH v7 3/8] package/pound: Fix build with
 OpenSSL 1.1.x
In-Reply-To: <CAKKE0ZGLvU4BrbW=Lj+V4XN-3cbTo9epEJh2pXfjKnMZDqVO+Q@mail.gmail.com>
 (Patrick Havelange's message of "Tue, 5 Feb 2019 10:19:20 +0100")
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-3-patrick.havelange@essensium.com>
 <CANQCQpZqdy-GnH4WMOR3g98t0aZM4PScjb3qfTCQqZ5=Qe0MkQ@mail.gmail.com>
 <CAKKE0ZGLvU4BrbW=Lj+V4XN-3cbTo9epEJh2pXfjKnMZDqVO+Q@mail.gmail.com>
Message-ID: <87o97qpnvh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

 > On Tue, Feb 5, 2019 at 2:26 AM Matthew Weber <matthew.weber@collins.com> wrote:
 >> 
 >> Patrick H,
 >> On Tue, Jan 29, 2019 at 3:40 AM Patrick Havelange
 >> <patrick.havelange@essensium.com> wrote:
 >> >
 >> > From: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> >
 >> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
 >> >
 >> 
 >> Does this resolve:
 >> http://autobuild.buildroot.net/results/613/61336369ebe69a57098edabdf94a47f776a0440f/build-end.log
 >> ?

 > Looking at the patch and the error in that build log, it matches, so I
 > would say yes. (I didn't retry locally without the patch applied).

But the patch breaks builds against libressl:

http://lists.busybox.net/pipermail/buildroot/2019-January/241827.html

Care to fix that and send an updated patch?

-- 
Bye, Peter Korsgaard
