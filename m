From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:50:19 +0200
Subject: [Buildroot] [PATCH v4 7/9] package/pkg-generic: handle
 host-ccache as a regular dependency
In-Reply-To: <20180324142008.10375-8-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:06 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-8-thomas.petazzoni@bootlin.com>
Message-ID: <877eq0w3wk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This moves the host-ccache dependency handling from
 > DEPENDENCIES_HOST_PREREQ to a proper package dependency. When
 > BR2_CCACHE=y, we add host-ccache as a regular dependency of all
 > packages except:

 >  - The extractor packages host-tar, host-xz and host-lzip

 >  - host-ccache itself

 >  - host-skeleton, because all packages depend on it

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes since v3:
 >  - Prevent host-ccache from being a dependency of itself, as noticed
 >    by Yann.

 > Changes since v2:
 >  - New patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
