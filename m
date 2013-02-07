From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 16:27:48 +0100
Subject: [Buildroot] [PATCH] boost: Pass staging dir to --with-icu
 option.
In-Reply-To: <20130207152426.GA27115@zenon.in.qult.net>
References: <20130207134835.GA23603@zenon.in.qult.net>
 <20130207154700.1d1da42b@skate>
 <20130207152426.GA27115@zenon.in.qult.net>
Message-ID: <20130207162748.7397a62a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ignacy Gawedzki,

On Thu, 7 Feb 2013 16:24:26 +0100, Ignacy Gawedzki wrote:

> The answer to this question may be in the following lines of
> bootstrap.sh.  If ICU is not found in any of those "common"
> locations, then bjam is called without any -sICU_PATH option and it
> may be that it finds the correct location automatically (by using
> passed LDFLAGS or something).

Ok, makes sense. Thank you!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
