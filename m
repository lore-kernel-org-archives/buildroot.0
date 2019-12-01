From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 19:08:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/openvmtools: vmware disk
 timeout udev rules fix
In-Reply-To: <20191129142256.6104-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Fri, 29 Nov 2019 15:22:56 +0100")
References: <20191129142256.6104-1-p.debruijn@unilogic.nl>
Message-ID: <87pnh7rk9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > Fixes: Invalid value "/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'" for RUN (char 27: invalid substitution type), ignoring, but please fix
 > Source: https://github.com/vmware/open-vm-tools/pull/376

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Committed after extending the description, thanks.

-- 
Bye, Peter Korsgaard
