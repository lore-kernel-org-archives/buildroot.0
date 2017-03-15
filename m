From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 15 Mar 2017 10:31:53 +0000
Subject: [Buildroot] [PATCH 2/3] libgtk3: gdk-wayland backend depends on
 libX11
In-Reply-To: <20170314232256.4dfd5f7d@free-electrons.com>
References: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
 <20170314114628.10147-2-Vincent.Riera@imgtec.com>
 <20170314172254.367744f2@free-electrons.com>
 <0778ff37-bb18-3b1b-3666-77ca979a9958@imgtec.com>
 <20170314232256.4dfd5f7d@free-electrons.com>
Message-ID: <0304dc80-56c1-f22c-a5de-72759523ff1c@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 14/03/17 22:22, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 14 Mar 2017 16:39:04 +0000, Vicente Olivert Riera wrote:
> 
>>> This feels weird. Isn't the point of the Wayland backend specifically
>>> to be used with Wayland, and therefore not to depend on anything X.org
>>> related?
>>>
>>> Isn't this a bug in Gtk, rather than something we should fix with an
>>> additional dependency?  
>>
>> maybe the gdk-wayland backend is necessary to run gtk3 apps on a Wayland
>> display server, but it still needs some libX11 bits because the support
>> is not complete. Just guessing :P
> 
> With which OpenGL ES/EGL provider did you get this build failure?

BR2_PACKAGE_MESA3D_OPENGL_EGL

Vincent

> 
> Thanks!
> 
> Thomas
> 
