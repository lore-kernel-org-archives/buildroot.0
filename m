From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 13 Dec 2018 17:14:57 +0100
Subject: [Buildroot] <PKG>_SOURCE without a version?
In-Reply-To: <1575802942.2620821.1544694785908.JavaMail.zimbra@datacom.com.br>
References: <CAJtjsKZ8j6x9cHEuCZVuYu0YVcYZjzxM4vYpbPek+PZ7cC7cvQ@mail.gmail.com>
 <1575802942.2620821.1544694785908.JavaMail.zimbra@datacom.com.br>
Message-ID: <CAJtjsKbCx68wv1rsE7eUYkgur8kWifKmrctzhzGZuj3yuBsQrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 13, 2018 at 10:52 AM Carlos Santos <casantos@datacom.com.br> wrote:
>
> You can cheat, as in
>
>     https://patchwork.ozlabs.org/patch/849230/
>
> Notice that we use $(<PKG>_DL_DIR) now, instead of $(DL_DIR).

Thanks Carlos. I was looking for such a discussion on the subject but
didn't find it.
I've asked upstream if they can rename the distributed sources.

-- 
Johan
