From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 12:54:28 +0200
Subject: [Buildroot] [PATCH v3 02/37] package/expedite: move to package
 directory
In-Reply-To: <1444471422-15118-3-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
 <1444471422-15118-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151010125428.002de0af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 10 Oct 2015 12:03:07 +0200, Romain Naour wrote:
> Add efl reverse dependencies.

This is a bit of a poor commit log. Why do you move expedite to the
package/ directory? And what does it mean to "add reverse
dependencies" ?

Also, it seems like you don't have rename detection enabled in Git.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
