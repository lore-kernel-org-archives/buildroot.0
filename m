From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Sun, 14 Apr 2019 20:51:21 +0200
Subject: [Buildroot] New Package: Entware
In-Reply-To: <bf8f0cba-e376-d800-df1f-8b44581a2f4c@mind.be>
References: <CALtfCQZa9OH-LFC12DtAV=3Ff9wMphcLhBmNyeRqmym7BsFAJw@mail.gmail.com>
 <50885bb4-64a7-e6bc-36e2-ac468050df3a@mind.be>
 <bf8f0cba-e376-d800-df1f-8b44581a2f4c@mind.be>
Message-ID: <CALtfCQY6aaSU-hq3P_z1avXs7g6LUx7VanA12bp84rDovuGGVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Apr 2019 at 20:23, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Let me clarify that: if you want to use OpenWrt packages on a Buildroot-built
> system, why do you use Buildroot to build your system anyway? Just use OpenWrt...

Yes, I agree with you but in some cases, it could be useful. For
example, I have a customer that he doesn't know how to use buildroot,
and I cannot build for him a new release for only a new package and
sometimes he needs to install some extra package, for example: mysql,
php and so on. The method of using ipkg/opkg was very useful for him,
but it seems to be that opkg is old fashioned and Entware is cool.

I'm going to try to create a new package with your piece of advice.

Best regards,
Oscar Gomez Fuente
