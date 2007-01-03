From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 3 Jan 2007 10:35:14 +0100
Subject: [Buildroot] offline buiding
In-Reply-To: <ed4892840701030051q6893bf0bq4ac3f7427532f970@mail.gmail.com>
References: <ed4892840701030051q6893bf0bq4ac3f7427532f970@mail.gmail.com>
Message-ID: <20070103103514.87ac8f4a.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> hi,
> 
> i am about to use buidroot to build a cross toolchain on a linux host.
>  but the host does not get an internet connection.  after read the
> intro of buildroot, i found it need to grab files on internet in the
> building process.  is there an offline building mode? thanks.

Hi,

Get all the source packages and put it in the dl directory of your
buildroot root.

Philippe
