From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 6 Nov 2009 09:59:28 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <1257497536.1962.15.camel@bender>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<1257497536.1962.15.camel@bender>
Message-ID: <op.u2ytxehoyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 06 Nov 2009 09:52:16 +0100, Sven Neumann <s.neumann@raumfeld.com>  
wrote:

>
> glib is http://library.gnome.org/devel/glib/stable/glib.html and should
> not be confused with glibc.
>
> I assume that some package you selected pulled in libglib2, which itself
> pulls in other things like iconv. Just check your package selection and
> make sure that you only select the packages you absolutely need.


Thanks for clearing that up! I found glib_genmarshal in /usr/bin, but I  
have absolutely no idea of why it has been included. There is no package I  
can find that mentions it. Also, this does not explain the duplicate  
libstdc++ libraries.


Attaching the complete configuration.

-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc.config
Type: application/octet-stream
Size: 5923 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091106/34bd791d/attachment-0003.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox.config
Type: application/octet-stream
Size: 22906 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091106/34bd791d/attachment-0004.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: multicon.config
Type: application/octet-stream
Size: 19696 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091106/34bd791d/attachment-0005.obj>
