From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 20 Dec 2007 18:00:25 +0200
Subject: [Buildroot] Build error
In-Reply-To: <476A7DA6.7000102@carallon.com>
References: <476A7DA6.7000102@carallon.com>
Message-ID: <476A9199.4080900@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Can someone explain what the errors mean? It appears to be an error when 
> linking the kernel but how can adding a package cause this?
> 
> Any help is much appreciated.
> 
> Will.
> 

Hi Will,

try to compile kernel/buildroot with make V=1
and compare compiler options passed to kernel in both cases - with and without qtopia

Regards,
Ivan
-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
