From: Raul Hidalgo Caballero <deinok@deinok.com>
Date: Sat, 12 Dec 2020 17:26:32 +0100
Subject: [Buildroot] package/dotnet: add host-dotnet-sdk
Message-ID: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds host-dotnet-sdk , for now it only works on x86_64 but it could
also work for armv5 and aarch64 (Will be done in the future).

Notice that to build  dotnet, you need a working dotnet. This is the reason
for host is just downloading and extracting a precompiled one
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201212/692f4dcf/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-dotnet-add-host-dotnet-sdk.patch
Type: text/x-patch
Size: 3202 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201212/692f4dcf/attachment.bin>
