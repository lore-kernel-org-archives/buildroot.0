From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Thu, 14 Feb 2013 07:38:12 +0200
Subject: [Buildroot] [PATCH v3 1/1] openpgm: new package
In-Reply-To: <511C0FE0.8020105@mind.be>
References: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
 <511C0FE0.8020105@mind.be>
Message-ID: <511C7843.4030405@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Arnout, All!

On 02/14/2013 12:12 AM, Arnout Vandecappelle wrote:
>> The package can be built without WCHAR but this is supported
>> only by its SCons and CMake build systems (for development). Autotools
>> based build system (for releases) does not support this. IPV6 and
>> thread support requirements are mandatory.
>  In that case, why not just use cmake instead of autotools?

To quote the INSTALL for the package:
"Note this package includes three build systems each with different targets:

 * SCons is used for development, there is minimal auto-configuration, one
   SConstruct script per target compiler and platform.

 * Autoconf is used for Unix-only library release.

 * CMake is used for Windows-only library release and installer packaging.
"

--
Best regards,
  Alexander Lukichev
