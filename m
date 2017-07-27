From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 27 Jul 2017 11:19:02 +0100
Subject: [Buildroot] [PATCH 0/3] Add support for Meson build
In-Reply-To: <1501150411.21202.1.camel@embedded.rocks>
References: <20170727094528.10745-1-joerg.krause@embedded.rocks>
 <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
 <1501150411.21202.1.camel@embedded.rocks>
Message-ID: <bbae61aa-7e81-21b6-d7f8-2489b39e2893@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On 27/07/17 11:13, J?rg Krause wrote:
> Hello Vincent,
> 
> On Thu, 2017-07-27 at 11:11 +0100, Vicente Olivert Riera wrote:
>> Hello J?rg, maintainers,
>>
>> shouldn't we add a "package/pkg-meson.mk" file and then use "$(eval
>> $(meson-package))" for Meson packages?
> 
> Maybe, if there are more than one package. At least, that was the
> opinion of Yann when he reviewed the patch last year.

There will be more packages moving to Meson, and some of them quite
important: http://mesonbuild.com/Users.html

I think we should add proper Meson support in BR infra from the beginning.

Vincent

> 
> J?rg
> 
