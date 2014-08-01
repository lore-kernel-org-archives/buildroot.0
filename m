From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 1 Aug 2014 16:59:38 +0200
Subject: [Buildroot] github download helper question
In-Reply-To: <20140801120714.GH32743@waldemar-brodkorb.de>
References: <20140801120714.GH32743@waldemar-brodkorb.de>
Message-ID: <CAHXCMMLE8qpVZoUkUtRXL=+xOTnhsSa-y8CTnJXBMhZaH_q6GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Fri, Aug 1, 2014 at 2:07 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Hi Developers,
>
> for ARC C library testing I would like to use
> a special branch of
> https://github.com/foss-for-synopsys-dwc-arc-processors/gcc.
> How I can do this with buildroot?

Just set the right sha1 as version, further details at [1].

> I need the arc-4.8-tls branch to test the uClibc NPTL port
> for ARC.
>
> The manual is empty:
> http://nightly.buildroot.org/manual.html#download-infra
>
> Unfortunately I do not understand the involved make
> magic to download stuff from github.
>
> Thanks for any hints,
>  Waldemar
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

[1] http://nightly.buildroot.org/manual.html#github-download-url


-- 
Samuel
