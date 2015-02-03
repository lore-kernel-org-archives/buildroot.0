From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:29:55 +0100
Subject: [Buildroot] [PATCH v6 08/16] erlang-p1-xml: new package.
In-Reply-To: <1421055140-5092-9-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-9-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150203102955.2b138c89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 12 Jan 2015 10:32:12 +0100, Johan Oudinet wrote:

> +ERLANG_P1_XML_VERSION = b530983
> +ERLANG_P1_XML_SITE = $(call github,processone,xml,$(ERLANG_P1_XML_VERSION))
> +ERLANG_P1_XML_LICENSE = GPLv2

License is really GPLv2+ and not GPLv2. Committed with this fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
