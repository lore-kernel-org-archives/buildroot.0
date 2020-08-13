From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 14 Aug 2020 00:09:11 +0200
Subject: [Buildroot] [PATCH 1/7] utils/{check-package,
 checkpackagelib}: consistently use raw strings for re.compile
In-Reply-To: <20200812142906.598755-2-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
 <20200812142906.598755-2-thomas.petazzoni@bootlin.com>
Message-ID: <6fa11229-f527-8b0d-757b-92b84c0362fa@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and all,

On 12/08/20 16:28, Thomas Petazzoni wrote:
> Raw strings need to be used when calling re.compile() otherwise Python
> 3.x flake8 complains with:
> 
> W605 invalid escape sequence '\s'
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
