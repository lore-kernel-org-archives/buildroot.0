From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 21:04:36 +0200
Subject: [Buildroot] [PATCH v5 06/34] package/kodi-jsonschemabuilder:
 new host package
In-Reply-To: <qsfssdx9sb.ln2@ID-313208.user.individual.net>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-7-bernd.kuhls@t-online.de>
 <20170422091649.GG15086@scaer>
 <qsfssdx9sb.ln2@ID-313208.user.individual.net>
Message-ID: <20170422190436.GI15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-22 19:18 +0200, Bernd Kuhls spake thusly:
> Am Sat, 22 Apr 2017 11:16:49 +0200 schrieb Yann E. MORIN:
> 
> >> new file mode 120000
> >> index 000000000..92a75949b
> >> --- /dev/null
> >> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
> >> @@ -0,0 +1 @@
> >> +/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/package/kodi/kodi.hash
> >> \ No newline at end of file
> > 
> > Uh-Oh, bad symlink... :-/
> 
> I used the package mesa3d-headers as an example, its .hash file is a 
> symlink to mesa3d/mesa3d.hash. This construct was coded by you ;)

Yes, indeed, but the symlink you created is absolute. You should make it
relative.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
