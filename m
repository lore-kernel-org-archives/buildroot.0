From: Christian Stewart <christian@paral.in>
Date: Wed, 5 Dec 2018 18:23:38 -0800
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <ec3f3d11856642d09f7a59f5d1fe3dbd@exitstrategytech.com>
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
 <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
 <CA+h8R2pH=BTTh+farCMfJOW8dzYsUhN_ompMtc=Aaz4tQVbVXg@mail.gmail.com>
 <5db9d4aa533e4e8590b5c33d2bb47665@exitstrategytech.com>
 <p05ed2odjpa9vgdmd5cx9cew.1544054248971@email.android.com>
 <CA+h8R2orLF5mjc6g8qDwG5Sh0WMXicnLb9DTB_qQiTBoJd45yA@mail.gmail.com>
 <6e255ac5c09e4841ac67d6f383249556@exitstrategytech.com>
 <99kkgapwmjckouvyyw5vo6pe.1544060571584@email.android.com>
 <CA+h8R2oK2mPefnBQ9c-jd7m4Tc7=s-0nsCV965r9DpsVTULuaA@mail.gmail.com>
 <ec3f3d11856642d09f7a59f5d1fe3dbd@exitstrategytech.com>
Message-ID: <CA+h8R2odgbjQYv2CbQBGCn-6mPcw3_AJoPuXhBdATVtmb5HpcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Wed, Dec 5, 2018 at 6:18 PM David J. Fogle <Dave@exitstrategytech.com> wrote:
> I was able to get docker to run far enough along to complain about cgroup support lacking

The Docker developers created a script to check a kernel .config file
for the required options, you may find it useful.

https://github.com/docker/engine/blob/master/contrib/check-config.sh

Best regards,
Christian
