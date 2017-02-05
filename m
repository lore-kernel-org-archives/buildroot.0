From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 23:04:12 +0100
Subject: [Buildroot] [PATCH v3 1/2] python-gunicorn: new package
In-Reply-To: <20170130141118.6587-1-lionel@svkt.org>
References: <20170130122032.3113-1-lionel@svkt.org>
 <20170130141118.6587-1-lionel@svkt.org>
Message-ID: <20170205230412.24d91f33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jan 2017 15:11:17 +0100, Lionel Flandrin wrote:
> Gunicorn ?Green Unicorn? is a Python WSGI HTTP Server for UNIX. It?s a
> pre-fork worker model ported from Ruby?s Unicorn project. The Gunicorn
> server is broadly compatible with various web frameworks, simply
> implemented, light on server resource usage, and fairly speedy.
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> 
> ---
> Changes v1 -> v2:
>   - Remove ZLIB dependency
>   - Change license to MIT

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
