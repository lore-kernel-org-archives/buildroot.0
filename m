From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Apr 2017 19:18:50 +0200
Subject: [Buildroot] [PATCH v5 06/34] package/kodi-jsonschemabuilder:
	new host package
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-7-bernd.kuhls@t-online.de>
 <20170422091649.GG15086@scaer>
Message-ID: <qsfssdx9sb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 22 Apr 2017 11:16:49 +0200 schrieb Yann E. MORIN:

>> new file mode 120000
>> index 000000000..92a75949b
>> --- /dev/null
>> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
>> @@ -0,0 +1 @@
>> +/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/package/kodi/kodi.hash
>> \ No newline at end of file
> 
> Uh-Oh, bad symlink... :-/

Hi Yann,

I used the package mesa3d-headers as an example, its .hash file is a 
symlink to mesa3d/mesa3d.hash. This construct was coded by you ;)

https://git.buildroot.net/buildroot/commit/package/mesa3d-headers?
id=8138a360181b60573ce070eb86b80f546dfc9cba

Regards, Bernd
