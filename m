From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Nov 2020 22:09:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: needs wchar
In-Reply-To: <20201101165738.2334483-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Nov 2020 17:57:38 +0100")
References: <20201101165738.2334483-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9ena2ky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > wchar is needed since version LTS_07_2020_Ref01 which bumped internal
 > umock with
 > https://github.com/Azure/azure-iot-sdk-c/commit/8a27860452ec7345bce84d6690b0e8d167b7560a

 > Indeed umock unconditionally depends on wchar since
 > https://github.com/Azure/umock-c/commit/6b8e0160defb23ec4fde159ba6389cf61e352a0b

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ad7ecd00d8f55c7cae5886c38c097ff0d071a962

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
