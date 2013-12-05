From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Dec 2013 09:52:57 -0300
Subject: [Buildroot] [PATCH] pkg-config: remove deprecated
In-Reply-To: <CAAXf6LX5XR8fh7hWUfxO2GOLdyykhLM4Ym9tq2PgwRUEmRK3CQ@mail.gmail.com>
References: <1386245156-21088-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LX5XR8fh7hWUfxO2GOLdyykhLM4Ym9tq2PgwRUEmRK3CQ@mail.gmail.com>
Message-ID: <52A07729.1000109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/2013 09:46 AM, Thomas De Schampheleire wrote:

> File package/pkgconf/pkgconf.mk still contains a reference to
> BR2_PACKAGE_PKG_CONFIG that should be removed now...

True, it's just a no-op, sending v2.
