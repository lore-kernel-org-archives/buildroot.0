From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 27 Jul 2017 12:13:31 +0200
Subject: [Buildroot] [PATCH 0/3] Add support for Meson build
In-Reply-To: <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
References: <20170727094528.10745-1-joerg.krause@embedded.rocks>
 <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
Message-ID: <1501150411.21202.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vincent,

On Thu, 2017-07-27 at 11:11 +0100, Vicente Olivert Riera wrote:
> Hello J?rg, maintainers,
> 
> shouldn't we add a "package/pkg-meson.mk" file and then use "$(eval
> $(meson-package))" for Meson packages?

Maybe, if there are more than one package. At least, that was the
opinion of Yann when he reviewed the patch last year.

J?rg
