From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Sep 2013 15:41:55 +0200
Subject: [Buildroot] [PATCH] Add lesstif package
In-Reply-To: <87zjr59rgu.fsf@dell.be.48ers.dk>
References: <523A9EE2.9050701@wanadoo.fr>
	<87zjr59rgu.fsf@dell.be.48ers.dk>
Message-ID: <20130922154155.09a7fa50@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thierry,

On Sun, 22 Sep 2013 10:43:29 +0200, Peter Korsgaard wrote:

>  Thierry>  	menu "X11R7 Libraries"
>  Thierry> +		source package/x11r7/lesstif/Config.in

I am also unsure it should be under package/x11r7/. What we normally
keep under package/x11r7/ is really the X.org stack itself, which comes
from the X.org project. As I understand it, Lesstif is more a toolkit
such as Gtk/Qt/EFL, so it should probably be packaged directly in
package/.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
