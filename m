From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Jun 2015 22:25:57 -0300
Subject: [Buildroot] [PATCH 1/2] uclibc: use uClibc-ng by default
In-Reply-To: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <557CD825.4080907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/06/15 14:21, Thomas Petazzoni wrote:

> Since the uClibc project is not making any release since about 3
> years, and the uClibc-ng project is now alive and delivering regular
> releases based on uClibc master plus a number of fixes, let's make
> uClibc-ng the default uClibc version used by Buildroot.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(e500v2 real target works fine, in general for webkit via qemu it works 
fine)
