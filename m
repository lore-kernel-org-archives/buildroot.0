From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 22 Dec 2009 10:10:49 +0100
Subject: [Buildroot] BR + CT-NG integration
In-Reply-To: <2c9a759f0912220031q1e1c0063ja28c1072d377ce84@mail.gmail.com>
References: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
	<2c9a759f0912220031q1e1c0063ja28c1072d377ce84@mail.gmail.com>
Message-ID: <4B308D19.1040107@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anders, All!

Anders Darander wrote:
> If it's not already on the list, I'd like you to add the debug-root as
> a toolchain option available for buildroot. My reason is that I'd like
> to update and get my patch [1] to install gdbserver from crosstool-NG
> to the target system integrated into buildroot.

That's a good thing indeed.

I guess there will need to be more work in that area, as CT-NG also provides
a few other "debug" utilities that are also currently handled by buildroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
