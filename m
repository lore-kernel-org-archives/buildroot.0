From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 14 Aug 2020 00:10:51 +0200
Subject: [Buildroot] [PATCH 2/7] support/testing: consistently use raw
 strings for re.compile
In-Reply-To: <20200812142906.598755-3-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
 <20200812142906.598755-3-thomas.petazzoni@bootlin.com>
Message-ID: <55f85ba7-14ec-5c26-767f-8efa7cbb505b@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all,

On 12/08/20 16:29, Thomas Petazzoni wrote:
> Otherwise Python 3.x flake8 complains with:
> 
> W605 invalid escape sequence '\s'
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
