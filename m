From: fabien.marteau at armadeus.com <fabien.marteau@armadeus.com>
Date: Tue, 14 Jun 2011 18:32:41 +0200
Subject: [Buildroot] Adding COPY target download method for specific package
Message-ID: <1308069162-7315-1-git-send-email-fabien.marteau@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In somes specifics cases, we have to had packages that are not available on the
internet. For example, in the case of non-free software, or in the case of
package that is board related (as_devices in ARMadeus project for example).
I did'nt find any methods to copy a package from a specific directory path in
host computer to buildroot project.
Then I added the method "copy" to copy directory content given in $(PKG)_SITE
variable.

regards.

Fabien M
