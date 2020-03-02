From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Mar 2020 14:31:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/classpath: drop package
In-Reply-To: <20200302100146.74261-1-james.hilliard1@gmail.com>
References: <20200302100146.74261-1-james.hilliard1@gmail.com>
Message-ID: <20200302143151.19685f30@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Mar 2020 03:01:46 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> This package has been abandoned by upstream since 2016 and has not
> had a release since 2012. In addition the GNU Compiler for Java
> that classpath was written to be used with has been removed as of
> GCC 7.
> 
> It is no longer feasible to support classpath as it requires a java
> compiler capable of producing java 1.5 compatible bytecode which is
> not possible on hosts with a recent java compiler.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

package/jamvm is using classpath, so you can't remove classpath just
like that, without taking into account the presence of jamvm.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
