From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 4 Oct 2019 15:27:02 +0200
Subject: [Buildroot] [PATCH 1/1] uacme: fix c99 detection on
 microblazeel, powerpc
In-Reply-To: <20191004134500.520a3437@windsurf>
References: <20191004095315.g6arwc7yy46c4o6u@einstein.dilieto.eu>
 <20191004134500.520a3437@windsurf>
Message-ID: <20191004132702.jpywtqqklmfc6kkq@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 04, 2019 at 01:45:00PM +0200, Thomas Petazzoni wrote:
>So, the commit title should be:
>
>	package/uacme: fix c99 detection on !wchar toolchains
>
>and the code should be just:
>
>UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>
>i.e, unconditional.
>

Hello Thomas, 

as suggested, new patch version

http://lists.busybox.net/pipermail/buildroot/2019-October/261605.html

Thanks for your time
Nicola
