From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Jun 2021 16:35:00 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 11, 12}.x series
In-Reply-To: <CAOMZO5CtwFkZJoKWPxz9jzcRkfmWGoBvJYWJgq=41G1voGZqhA@mail.gmail.com>
 (Fabio Estevam's message of "Sat, 12 Jun 2021 08:49:16 -0300")
References: <20210612114342.10118-1-peter@korsgaard.com>
 <CAOMZO5CtwFkZJoKWPxz9jzcRkfmWGoBvJYWJgq=41G1voGZqhA@mail.gmail.com>
Message-ID: <87lf7fducr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Hi Peter,
 > On Sat, Jun 12, 2021 at 8:44 AM Peter Korsgaard <peter@korsgaard.com> wrote:

 >> +sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz

 > 5.11 is marked as EOL at kernel.org. Shouldn't it be removed from here?

I kept it here for an easier backport to 2021.05.x, but it could/should
indeed be dropped from master, either now or when we add 5.13.

-- 
Bye, Peter Korsgaard
