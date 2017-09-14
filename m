From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 14 Sep 2017 09:53:19 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] python-six: add host variant
In-Reply-To: <20170913132055.12371-1-julien.floret@6wind.com>
References: <20170913132055.12371-1-julien.floret@6wind.com>
Message-ID: <1928743391.9313714.1505393599814.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Julien Floret" <julien.floret@6wind.com>
> To: buildroot at buildroot.org
> Sent: Wednesday, September 13, 2017 10:20:55 AM
> Subject: [Buildroot] [PATCH v2] python-six: add host variant

> While currently there is no in-tree Buildroot package which depends on
> host-python-six, it can be needed to build external packages.

It is required to build host-python-protobuf, which in its turn is
necessary to build one of our (DATACOM) proprietary packages. So far
we have been keeping host-python-{protobuf,six} as local patches, so
your change is very helpful. Thanks! 

> Signed-off-by: Julien Floret <julien.floret@6wind.com>

Tested-by: Carlos Santos <casantos@datacom.ind.br>

---8<---

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
