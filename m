From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:30:19 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/avrdude: optionally depends
 on libftdi or libftdi1
In-Reply-To: <1426613796-4921-1-git-send-email-s.martin49@gmail.com>
References: <1426613796-4921-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150320233019.3b20e7a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 17 Mar 2015 18:36:35 +0100, Samuel Martin wrote:
> Avrdude supports both libftdi and libftdi1.
> 
> Because libftdi is already an optional dependency, this patch adds
> libftdi1 as optional dependency as well, but privileges libftdi1 over
> libftdi (accdording to what is done in  avrdude's configure script).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
