From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 14 Aug 2020 00:14:50 +0200
Subject: [Buildroot] [PATCH 4/7] utils/getdeveloperlib.py: use raw
 strings for re.compile/re.match
In-Reply-To: <20200812142906.598755-5-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
 <20200812142906.598755-5-thomas.petazzoni@bootlin.com>
Message-ID: <3241752e-0b07-045b-ed15-66dc37729b84@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 12/08/20 16:29, Thomas Petazzoni wrote:
> Fixes the following Python 3.x flake8 warning:
> 
> W605 invalid escape sequence '\s'
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
