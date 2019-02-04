From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 15:41:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/bird: bump version to 2.0.3
In-Reply-To: <CAFtSRGAAkpuyg7==BY7oQ++_uWTeYaZZnA9GjrB2aNXTazQj8Q@mail.gmail.com>
References: <20190204092208.maeiwjvs23rtxdap@sapphire.tkos.co.il>
 <20190204100200.3628-1-adrien@gallouet.fr>
 <20190204141129.34c40848@windsurf>
 <CAFtSRGAAkpuyg7==BY7oQ++_uWTeYaZZnA9GjrB2aNXTazQj8Q@mail.gmail.com>
Message-ID: <20190204154149.6c46e8ef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the mailing list in Cc and avoid top-posting. Thanks!

On Mon, 4 Feb 2019 15:17:44 +0100
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> Hi,
> Yes (I think). We can still download the first tag of BIRD released 9yrs
> ago.

Well, that it is not really the question I was asking. My question is
whether this tarball is always *exactly* identical. As you say, it's a
tarball generated automatically. Since we store a hash of the tarball
in bird.hash, if gitlab does some subtle changes in how the tarball is
generated, the hash will change, breaking the download.

We had this issue with Github in the past.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
