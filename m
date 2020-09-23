From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Sep 2020 07:08:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-reentry: add host
 variant
References: <20191025185448.32633-1-asafka7@gmail.com>
 <20191025185448.32633-6-asafka7@gmail.com>
Message-ID: <ar1r3hxkiu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 25 Oct 2019 21:54:48 +0300 schrieb Asaf Kahlon:

> Packages which use reentry will have setup_requires=['reentry'] and
> reentry_register=True in their setup.py.
> A host variant is needed in order to invoke reentry when building the
> package and register the entrypoints.

Hi,

as you pointed out in http://patchwork.ozlabs.org/project/buildroot/patch/
20191020190142.18672-2-asafka7 at gmail.com/

	"I don't see any Buildroot package which uses reentry..."

I think that your patch should not be applied to buildroot atm.

Regards, Bernd
