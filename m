From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Mar 2014 11:45:03 +0100
Subject: [Buildroot] [PATCH 10/12] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <bb2738648a4024d2d23b486d084633b111a2945e.1394055621.git.yann.morin.1998@free.fr>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
 <bb2738648a4024d2d23b486d084633b111a2945e.1394055621.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+hekZRrA2880S+96DY6H8+ZdyFe+h2jsxhFZ9NTZ2a2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 5, 2014 at 10:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Some of the packages that Buildroot might build are sensitive packages,
> related to security: openssl, dropbear, ca-certificates...
>
> Some of those packages are downloaded over plain http, because there is
> no way to get them over a secure channel, such as https.
>
> In these dark times of pervasive surveillance, the potential for harm that
> a tampered-with package could generate, we may want to check the integrity
> of those sensitive packages.
>
> So, each package may now provide a list of hashes for all files that needs
> to be downloaded, and Buildroot will just fail if any downloaded file does
> not match its known hash, in which case it is removed.
>
> Hashes can be any of the md5, sha1 or sha2 variants, and will be checked
> even if the file was pre-downloaded.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
