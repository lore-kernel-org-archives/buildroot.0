From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Nov 2011 23:08:06 -0300
Subject: [Buildroot] [PATCH 2/6] devmem2: remove deprecated
In-Reply-To: <1320802426.21095.YahooMailClassic@web161403.mail.bf1.yahoo.com>
References: <1320802426.21095.YahooMailClassic@web161403.mail.bf1.yahoo.com>
Message-ID: <c5b890afa07d6faa71003d1ecc6decd9@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08.11.2011 22:33, David Anders wrote:

> just my opinion once again,
>
>
> the devmem2 implementation in busybox is worthless.
>
> if someone really wants devmem2, they are going to want the one that
> actually works.
>
> Dave

I've missed all the past discussion about it, just went looking for 
BR2_DEPRECATED packages that should be gone.
Just sent a patch to remove the deprecated tag and convert the package 
to modern standards.
Should be enough to keep it around.
Regards.
