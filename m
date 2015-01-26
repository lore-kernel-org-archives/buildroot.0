From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 26 Jan 2015 08:18:07 +0100
Subject: [Buildroot] [PATCH 3/6 v4] package/freerdp: add options to
 enable/disable server and/or client
In-Reply-To: <7184d9ae0f3be09bda1c35689a51ddb6d414e6e2.1422225347.git.yann.morin.1998@free.fr>
References: <cover.1422225347.git.yann.morin.1998@free.fr>
 <7184d9ae0f3be09bda1c35689a51ddb6d414e6e2.1422225347.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKcttYANRGp=p7FREx3WnTnN+LfizMxZyAjC=MshD9n=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 25, 2015 at 11:37 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Building the client or the server requires an X.Org stack.
>
> Since freerdp can also be used for weston (wayland-based, hence no X.Org
> stack), we may want to disable the client and server.
>
> Conversely, even with an X.Org stack, we may want to enable either or
> none if we're just interested in the library.
>
> Add two options, one to enable the server, the other the client; the
> client option defaults to 'Y' so that a previous .config can be re-used
> as-is, and exhibit the same behaviour as before; the server option
> defaults to 'N' as we were not ever building the server so far.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
