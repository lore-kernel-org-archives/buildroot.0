From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 07:21:26 +0100
Subject: [Buildroot] [PATCH] botan: fix static build
In-Reply-To: <CAB0FRsvgqpycJugj+xX4F7M=RW6OEuT9wpQOrzvONR425DAsiA@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Wed, 26 Nov 2014
 05:20:13 +0100")
References: <1416932097-12474-1-git-send-email-francois.perrad@gadz.org>
 <20141125164214.GA4690@tarshish>
 <CAB0FRsvgqpycJugj+xX4F7M=RW6OEuT9wpQOrzvONR425DAsiA@mail.gmail.com>
Message-ID: <87egsqqy6x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > 2014-11-25 17:42 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
 >> Hi Francois,
 >> 
 >> On Tue, Nov 25, 2014 at 05:14:57PM +0100, Francois Perrad wrote:
 >>> see http://autobuild.buildroot.net/results/2d1/2d1563e253b669b45c9df449c5b3a750c04a43dc/
 >> 
 >> Please mention in the commit log that this reverts commit
 >> 84047394ed6ad08adb9f59a9022553a327eef040. Elaborating a bit on --no-autoload
 >> would also be nice.
 >> 

 > You are right.  This patch contains a real fix in botan.mk and reverts
 > the previous commit which only disables BR2_PREFER_STATIC_LIB in
 > Config.in

So what does --no-autoload do?

-- 
Bye, Peter Korsgaard
