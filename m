From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Feb 2009 09:21:13 -0200
Subject: [Buildroot] Webserver
In-Reply-To: <4989C13E.5040603@ethertek.ca>
References: <4989C13E.5040603@ethertek.ca>
Message-ID: <498C1D29.9010601@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dan Pattison wrote:

> Lastly, does anyone know of a different web server for Buildroot that
> will make the most common web browsers (IE6, IE7, Firefox etc) pop up
> the username/password box?
> 
> Thank you, and Best Regards,
> Dan Pattison

You could also use lighttpd, it's somewhat bigger than the others but
it's feature-plenty.
It's already in buildroot, just enable the mod_auth module and you're
set to go...
Regards.
