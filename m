From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 23:19:28 +0100
Subject: [Buildroot] [PATCH v8 1/1] libcpprestsdk: new package
In-Reply-To: <20180114195644.22467-1-Adamduskett@outlook.com>
References: <20180114195644.22467-1-Adamduskett@outlook.com>
Message-ID: <20180115231928.5e930896@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Jan 2018 14:56:44 -0500, Adam Duskett wrote:
> From: Adam Duskett <aduskett@codeblue.com>
> 
> The C++ REST SDK is a Microsoft project for cloud-based client-server
> communication in native code using a modern asynchronous C++ API design.
> This project aims to help C++ developers connect to and interact with
> services.
> 
> This package is licensed under the MIT package and depends on BOOST
> and OpenSSL/LibreSSL.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
> Changes v1 -> v2:
>   - Add "depends on BR2_USE_WCHAR # boost" to boost.mk (Thomas)
>   - Remove "depends on BR2_USE_MMU" from boost.mk (Thomas)
>   - Add "!BR2_USE_WCHAR" to boost.mk (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
