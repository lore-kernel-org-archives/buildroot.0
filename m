From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 22:36:28 +0200
Subject: [Buildroot] [PATCH v4] ghostscript: bump version to 9.22
In-Reply-To: <20171017134828.32476-1-olivier.schonken@gmail.com>
References: <20171017134828.32476-1-olivier.schonken@gmail.com>
Message-ID: <20171017223628.0db89900@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 15:48:28 +0200, Olivier Schonken wrote:
> Remove patches that has been merged/updated upstream
> 
> 0002-Host-tool-mkromfs_1-needs-libz.patch
> -> http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=284f5fe121d8eb0a0f50a6f2465ee2f99a061018  
> 0003-Bug-697799-have-.eqproc-check-its-parameters.patch
> -> http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=4f83478c88c2e05d6e8d79ca4557eb039354d2f3  
>    http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=57f20719e1cfaea77b67cb26e26de7fe4d7f9b2e
>    http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=ccfd2c75ac9be4cbd369e4cbdd40ba11a0c7bdad
> 0004-Bug-697799-have-.rsdparams-check-its-parameters
> -> http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=04b37bbce174eed24edec7ad5b920eb93db4d47d  
>    http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=ccfd2c75ac9be4cbd369e4cbdd40ba11a0c7bdad
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
> v1 -> v2 : The sha1 hash for ghostpdl was mistakenly put in the
>            hash file.  v2 fixes this issue.
> v2 -> v3 : Replace md5 and sha1 hashes with sha256 and sha512
> v3 -> v4 : Add links to upstream commits that supersedes buildroot commits

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
