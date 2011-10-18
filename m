From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2011 19:27:08 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <6f1dea83ae8cd19b1f8304fee05d45d4@zacarias.com.ar>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018163202.504d5069@skate>
 <201110181055.22743.minimod@morethan.org>
 <6f1dea83ae8cd19b1f8304fee05d45d4@zacarias.com.ar>
Message-ID: <20111018192708.68b1ba88@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 18 Oct 2011 13:00:28 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Also contemplating how to properly do PKG_SIZE (for file size) and 
> PKG_HASH (MD5 and/or SHA1) for source consistency.

Do we actually want that ? I know OE does this, but tarball size and
hashes will be a pain to keep updated.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
