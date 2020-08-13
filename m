From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 14 Aug 2020 00:15:31 +0200
Subject: [Buildroot] [PATCH 5/7] utils/scanpypi: use raw strings in
 re.compile/re.sub
In-Reply-To: <20200812142906.598755-6-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
 <20200812142906.598755-6-thomas.petazzoni@bootlin.com>
Message-ID: <523436de-9d7c-f9e7-b088-d31bbf059ab3@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 12/08/20 16:29, Thomas Petazzoni wrote:
> Fixes the following Python 3.x flake8 warning:
> 
> W605 invalid escape sequence '\w'
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
