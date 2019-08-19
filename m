From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Aug 2019 23:26:43 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/libssh2: switch site to
 https://www.libssh2.org/download
In-Reply-To: <20190819203645.22366-1-fontaine.fabrice@gmail.com>
References: <20190819203645.22366-1-fontaine.fabrice@gmail.com>
Message-ID: <5fe22bc4-c768-96f3-48d3-8c6b8d6788e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/08/2019 22:36, Fabrice Fontaine wrote:
> --- a/package/libssh2/libssh2.hash
> +++ b/package/libssh2/libssh2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated

 It would be nice to add:

# Locally computed after verifying
# https://libssh2.org/download/libssh2-1.9.0.tar.gz.asc
# with key XXXX from https://yyyy


 Regards,
 Arnout

> -sha256 db257d41754b16518c3bd0c3b8dd08940ccbee5fc44cef7bfb052d930bcbbda3  libssh2-1.9.0.tar.gz
> +sha256 d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd  libssh2-1.9.0.tar.gz
>  sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9  COPYING
