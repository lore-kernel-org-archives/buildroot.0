From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 18 Jan 2007 05:32:30 +0100
Subject: [Buildroot] flex and ed packages get 404 error
In-Reply-To: <1d09f8b80701171818l51a06929s2c09c5f3fe711da0@mail.gmail.com>
References: <1d09f8b80701171818l51a06929s2c09c5f3fe711da0@mail.gmail.com>
Message-ID: <45AEF85E.4050705@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Buik skrev:
> I have tried to enable the flex and ed packages, but buildroot seems
> not to be able to find the files:
>
> wget --passive-ftp -P /home/will/box/buildroot/buildrootdev/dl
> http://ftp.debian.org/debian/pool/main/e/ed/ed_0.2-19.diff.gz
> --21:09:39--  http://ftp.debian.org/debian/pool/main/e/ed/ed_0.2-19.diff.gz
>            => `/home/will/box/buildroot/buildrootdev/dl/ed_0.2-19.diff.gz'
> Resolving ftp.debian.org... 128.101.240.212
> Connecting to ftp.debian.org|128.101.240.212|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 21:09:39 ERROR 404: Not Found.
>
>   
Gone from the server, replaced by "ed_0.2-20.diff.gz"

Ulf Samuelsson
