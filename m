From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Mar 2015 11:59:52 +0100
Subject: [Buildroot] [PATCH] perl: needs host-bison
In-Reply-To: <54F592F2.80405@zacarias.com.ar>
References: <1425378663-2659-1-git-send-email-gustavo@zacarias.com.ar>
 <20150303114820.32b71d7b@free-electrons.com>
 <54F592F2.80405@zacarias.com.ar>
Message-ID: <20150303115952.176deea6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 03 Mar 2015 07:54:42 -0300, Gustavo Zacarias wrote:

> For TARGET_MAKE_ENV maybe since it's only PATH, for HOST_MAKE_ENV it's
> not and it'll need extra testing to see that perl's build system doesn't
> fluke with the extras.

Worth trying IMO.

> So splitting between BR_PATH and TARGET_MAKE_ENV is possible but not
> visually consistent.
> Which begs the question: why do other packages use BR_PATH in the same
> way as well? (without using *_MAKE_ENV)

Because they should be using *_MAKE_ENV :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
