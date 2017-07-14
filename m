From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 15:31:19 +0200
Subject: [Buildroot] /etc//init.d init scripts in buildroot
In-Reply-To: <20170714151805.20514430@windsurf> (Thomas Petazzoni's message of
 "Fri, 14 Jul 2017 15:18:05 +0200")
References: <CALtfCQZAis0fX+J6NWTX+u=ZJB-0ZKoKgkBcteAJU4f+c46BJA@mail.gmail.com>
 <87shhzb3d1.fsf@dell.be.48ers.dk> <20170714151805.20514430@windsurf>
Message-ID: <87y3rr9mc8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 14 Jul 2017 14:38:18 +0200, Peter Korsgaard wrote:

 >> If this is not good enough then you need to handle the gpio in a kernel
 >> driver instead by registering a reboot notifier.

 > What about using the gpio-poweroff driver, which already exists in the
 > kernel ?

Ahh yes, even better - I wasn't aware of that driver.

-- 
Bye, Peter Korsgaard
